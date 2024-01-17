# mecab-ya

Yet another mecab wrapper for nodejs and the main purpose is easy to use.

And you can use this for Korean language with [mecab-ko](https://bitbucket.org/eunjeon/mecab-ko/).

## Install

```bash
$ npm install mecab-sw
```

## Requirements

You need mecab or mecab-ko for Korean language.

If you don't have mecab yet, you can install with the prepared script.

```bash
$ node_modules/mecab-ya/bin/install-mecab
```

For the Korean language.

```bash
$ node_modules/mecab-ya/bin/install-mecab ko
```

## Usage

mecab-ya use the mecab library in the `node_modules/mecab-sw/mecab` directory.

But, you can set a mecab library path like below.

```
MECAB_LIB_PATH=/usr/local/lib node index.js
```

OR

```
MECAB_LIB_PATH=/usr/local/lib/mecab-ko node index.js
```

So, you can select a mecab library for specific language when you use this and you can distribute this as a builtin library for AWS Lambda like that.

## Examples

```
var mecab = require('mecab-sw');

var text = '아버지가방에들어가신다';

mecab.pos(text, function (err, result) {
    console.log(result);
    /*
        [ [ '아버지', 'NNG' ],
          [ '가', 'JKS' ],
          [ '방', 'NNG' ],
          [ '에', 'JKB' ],
          [ '들어가', 'VV' ],
          [ '신다', 'EP+EC' ] ]
    */
});

mecab.morphs(text, function (err, result) {
    console.log(result);
    /*
        [ '아버지', '가', '방', '에', '들어가', '신다' ]
    */
});

mecab.nouns(text, function (err, result) {
    console.log(result);
    /*
        [ '아버지', '방' ]
    */
});

mecab.all(text, function (err, result) {
    console.log(result);
    /*
        [
          [
            '아버지', 'NNG',
            '*',      'F',
            '아버지', '*',
            '*',      '*',
            '*'
          ],
          [
            '가', 'JKS', '*',
            'F',  '가',  '*',
            '*',  '*',   '*'
          ],
          // ... and so on
        ]
    */
});
```

Synchronous versions are also available (just add 'Sync' to the function name)  
ex) `console.log(mecab.posSync("아버지가방에들어가신다"))`

# License

MIT
