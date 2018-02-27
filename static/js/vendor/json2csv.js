// quickly hacked from https://github.com/zemirco/json2csv to make it usable in browser
(function() {

  function json2csv(params, callback) {
    /**
     * Main function that converts json to csv
     *
     * @param {Object} params Function parameters containing data, fields,
     * delimiter (default is ',') and hasCSVColumnTitle (default is true)
     * @param {Function} callback(err, csv) - Callback function
     *   if error, returning error in call back.
     *   if csv is created successfully, returning csv output to callback.
     */
    checkParams(params, function(err) {
      if (err) return callback(err);
      createColumnTitles(params, function(err, title) {
        if (err) return callback(err);
        createColumnContent(params, title, function(csv) {
          callback(null, csv);
        });
      });
    });

    /**
     * get type of the passing variable
     * for more detail see http://javascriptweblog.wordpress.com/2011/08/08/fixing-the-javascript-typeof-operator/
     *
     * @param {Object} any variable to get type

     */
    var typeOf = function(obj) {
      return ({}).toString.call(obj).match(/\s([a-zA-Z]+)/)[1].toLowerCase();
    };

    /**
     * Check passing params
     *
     * @param {Object} params Function parameters containing data, fields,
     * delimiter and hasCSVColumnTitle
     * @param {Function} callback Callback function returning error when invalid field is found
     */
    function checkParams(params, callback) {
      //#check params.data
      params.data = JSON.parse(JSON.stringify(params.data));

      // if data is an Object, not in array [{}], then just create 1 item array.
      // So from now all data in array of object format.
      if (!Array.isArray(params.data)) {
        var ar = [];
        ar[0] = params.data;
        params.data = ar;
      }

      //#check fieldNames
      if (params.fieldNames && params.fieldNames.length !== params.fields.length) {
        callback(new Error('fieldNames and fields should be of the same length, if fieldNames is provided.'));
      }

      params.fieldNames = params.fieldNames || params.fields;

      //#check delimiter
      params.del = params.del || ',';

      //#check end of line character
      params.eol = params.eol || '';

      //#check hasCSVColumnTitle, if it is not explicitly set to false then true.
      if (params.hasCSVColumnTitle !== false) {
        params.hasCSVColumnTitle = true;
      }
      callback(null);
    }

    /**
     * Create the title row with all the provided fields as column headings
     *
     * @param {Object} params Function parameters containing data, fields and delimiter
     * @param {Function} callback Callback function returning error and title row as a string
     */
    function createColumnTitles(params, callback) {
      var str = '';

      //if CSV has column title, then create it
      if (params.hasCSVColumnTitle) {
        params.fieldNames.forEach(function(element) {
          if (str !== '') {
            str += params.del;
          }
          str += JSON.stringify(element);
        });
      }
      callback(null, str);
    }

    /**
     * Create the content column by column and row by row below the title
     *
     * @param {Object} params Function parameters containing data, fields and delimiter
     * @param {String} str Title row as a string
     * @param {Function} callback Callback function returning title row and all content rows
     */
    function createColumnContent(params, str, callback) {
      params.data.forEach(function(data_element) {
        //if null or empty object do nothing
        if (data_element && Object.getOwnPropertyNames(data_element).length > 0) {
          var line = '';
          // var eol = os.EOL || '\n';
          var eol = '\n';

          params.fields.forEach(function(field_element) {
            if (data_element.hasOwnProperty(field_element)) {
              line += JSON.stringify(data_element[field_element]);
            }
            line += params.del;
          });

          //remove last delimeter
          line = line.substring(0, line.length - 1);
          line = line.replace(/\\"/g, '""');

          //If header exists, add it, otherwise, print only content
          if (str !== '') {
            str += eol + line + params.eol;
          } else {
            str = line + params.eol;
          }
        }
      });
      callback(str);
    }
  }

  json2csv.version = "0.0.1";
  if (typeof define === "function" && define.amd) define(function() { return json2csv; });
  else if (typeof module === "object" && module.exports) module.exports = json2csv;
  else this.json2csv = json2csv;
})();
