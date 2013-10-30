# NumberHumanizer

[![Build Status](https://travis-ci.org/rosenfeld/number-humanizer.png)](https://travis-ci.org/rosenfeld/number-humanizer)

Converts numbers in an humanized format. See examples under spec/.

## Usage

```javascript
NumberHumanizer.formatNumber(1234567.89) == '1.23M'
NumberHumanizer.formatNumber(1204567.89) == '1.2M'
NumberHumanizer.formatNumber(1204567.89, { stripLastZeros: false }) == '1.20M'
NumberHumanizer.formatCurrency(1234567.89) == '$1.23M'
NumberHumanizer.formatNumber(1234567.89, { precision: 5 }) == '1.2345M'
```

The `precision` option specifies how many digits to use.

`formatCurrency` have a special case for numbers below 1,000:

```javascript
NumberHumanizer.formatCurrency(12.3) == '$12.30'
NumberHumanizer.formatCurrency(12.345) == '$12.35'
NumberHumanizer.formatCurrency(12.345, { currencyDecimals: 3 }) == '$12.345'
```

Most of the behaviors can be changed globally through `NumberHumanizer.defaults` options:

```javascript
{
  suffixes: [ '', 'k', 'M', 'B', 'T' ],
  // will be displayed if the value is too big to fit in the units above:
  unsupportedSuffix: 'UNSUPPORTED UNIT',
  precision: 3, // numbers of digits to include at most in the formatted value
  currencyDecimals: 2, // decimal places to use when formatting currency values lower than 1000
  stripLastZeros: true, // 1.20k -> 1.2k
  // only take effect if stripLastZeros is false:
  zeroPadding: '00000000000000000000000000000000' // '00' should be enough for a precision of 3
}
```

All options above can be overriden on each function call.

## Author

Rodrigo Rosenfeld Rosas

## License

MIT


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/rosenfeld/number-humanizer/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

