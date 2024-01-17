# mecab-sw

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
$ node_modules/mecab-sw/bin/install-mecab
```

For the Korean language.

```bash
$ node_modules/mecab-sw/bin/install-mecab ko
```

## Usage

mecab-sw use the mecab library in the `node_modules/mecab-sw/mecab` directory.

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

var text = '콩심은데콩나고팥심은데팥난다';

mecab.pos(text, function (err, result) {
    console.log(result);
    /*
        [ [ '콩', 'NNG', 0 ],
          [ '심', 'VV', 1 ],
          [ '은데', 'EC', 2 ],
          [ '콩', 'NNG', 4 ],
          [ '나', 'VV', 5 ],
          [ '고', 'EC', 6 ],
          [ '팥', 'NNG', 8 ],
          [ '심', 'VV', 9 ],
          [ '은데', 'EC', 10 ],
          [ '팥', 'NNG', 12 ],
          [ '난다', 'VV+EF', 13 ],
          [ '.', 'SF', 15 ] ]
    */
});

mecab.morphs(text, function (err, result) {
    console.log(result);
    /*
        [ [ '콩', 0 ],    [ '심', 1 ],
          [ '은데', 2 ],  [ '콩', 4 ],
          [ '나', 5 ],    [ '고', 6 ],
          [ '팥', 7 ],    [ '심', 8 ],
          [ '은데', 9 ],  [ '팥', 11 ],
          [ '난다', 12 ], [ '.', 14 ] ]
    */
});

mecab.nouns(text, function (err, result) {
    console.log(result);
    /*
        [ [ '콩', 0 ], [ '콩', 4 ], [ '팥', 7 ], [ '팥', 11 ] ]
    */
});

```

Synchronous versions are also available (just add 'Sync' to the function name)  
ex) `console.log(mecab.posSync("콩심은데콩나고팥심은데팥난다"))`

# License

MIT
