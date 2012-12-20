(exports ? this).NumberHumanizer = class NumberHumanizer
  @defaults =
    suffixes: ['', 'k', 'M', 'B', 'T']
    unsupportedSuffix: 'UNSUPPORTED UNIT'
    precision: 3 # number of digits to display at most
    currencyDecimals: 2
    stripLastZeros: true
    # only take effect if stripLastZeros is false:
    zeroPadding: '00000000000000000000000000000000' # '00' should be enough for a precision of 2

  @formatNumber: (number, options = {})=>
    precision = options.precision ? @defaults.precision
    number = number.toFixed precision
    integerPart = number.replace /\..*/, ''
    group = Math.floor((integerPart.length - 1) / 3)
    suffix = @defaults.suffixes[group] ? @defaults.unsupportedSuffix
    digits = number.replace '.', ''
    digits += options.zeroPadding ? @defaults.zeroPadding
    beforePrecisionIdx = integerPart.length - 1 - group * 3
    formatted = "#{digits[..beforePrecisionIdx]}"
    decimal = ".#{digits.substr beforePrecisionIdx + 1, precision - formatted.length}"
    decimal = decimal.replace /0+$/, '' if options.stripLastZeros ? @defaults.stripLastZeros
    formatted += decimal
    "#{formatted.replace(/\.0*$/, '')}#{suffix}"

  @formatCurrency: (number, options = {})=>
    decimals = options.currencyDecimals ? @defaults.currencyDecimals
    return "$#{number.toFixed(decimals).replace '.00', ''}" if number < 1000
    "$#{@formatNumber number, options}"
