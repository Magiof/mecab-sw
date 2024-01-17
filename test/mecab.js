var nodeunit = require('nodeunit');

var path = require('path'),
  mecab = require(path.resolve('mecab'));

var text = '콩심은데콩나고팥심은데팥난다.';

exports.mecab = {
  pos: function (test) {
    test.expect(2);

    mecab.pos(text, function (err, result) {
      test.equals(result.length, 12);
      test.equals(result[0].length, 3);
      test.done();
    });
  },

  morphs: function (test) {
    test.expect(2);

    mecab.morphs(text, function (err, result) {
      test.equals(result.length, 12);
      test.equals(result[0].toString(), ['콩', 0].toString());
      test.done();
    });
  },

  nouns: function (test) {
    test.expect(1);

    mecab.nouns(text, function (err, result) {
      test.equals(result.length, 4);
      test.done();
    });
  },
};
