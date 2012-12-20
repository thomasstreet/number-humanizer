NH = require('../lib/number-humanizer').NumberHumanizer
formatNumber = NH.formatNumber
formatCurrency = NH.formatCurrency

describe 'NumberHumanizer', ->
  it 'formats 100,000 as 100k', -> expect(formatNumber 100000).toEqual '100k'
  it 'formats 1,000,000 as 1M', -> expect(formatNumber 1000000).toEqual '1M'
  it 'formats 30 as 30', -> expect(formatNumber 30).toEqual '30'
  it 'formats 71,340,000,000 as 71B', -> expect(formatNumber Math.pow(10, 9) * 71.34).toEqual '71.3B'
  it 'formats 7,130,000,000 as 71B', -> expect(formatNumber Math.pow(10, 9) * 7.13).toEqual '7.13B'
  it 'formats 123,456 [precision=5] as 123.45k', ->
    expect(formatNumber 123456, precision: 5).toEqual '123.45k'
  it 'formats 123,456 [precision=7] as 123.4560k', ->
    expect(formatNumber 123456.7, precision: 7).toEqual '123.4567k'
  it 'formats 123,404 [precision=0] as 123k', ->
    expect(formatNumber 123456, precision: 0).toEqual '123k'
  it 'formats 1,204 as 1.2k (no extra zeros)', -> expect(formatCurrency 1204).toEqual '$1.2k'
  it 'formats 1,204[stripLastZeros: false] as 1.20k', ->
    expect(formatCurrency 1204, stripLastZeros: false).toEqual '$1.20k'

  describe 'Currency formatter', ->
    it 'formats 123,456 as $123k', -> expect(formatCurrency 123456).toEqual '$123k'
    it 'formats 3 as $3', -> expect(formatCurrency 3).toEqual '$3'
    it 'formats 3.2 as $3.20', -> expect(formatCurrency 3.2).toEqual '$3.20'
    it 'formats 999.345 as $999.35', -> expect(formatCurrency 999.345).toEqual '$999.35'
