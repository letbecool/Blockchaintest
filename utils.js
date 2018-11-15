const fs = require('fs')

module.exports = {


    /**
     * Represents a book.
     * @param {integer} length - The length of the random string to generate.
     */

    genRandomStr: () => {

        return '0x' + Math.floor(Math.random() * 10 + Math.random() * 10 + Math.random() * 1000);


    }

    ,

    /**
     * Returns the current date and date 
     */



    getCurentDateTime: () => {

        const now = new Date();

        const options = {
            weekday: 'long',
            year: 'numeric',
            month: 'short',
            day: 'numeric',
            hour: '2-digit',
            minute: '2-digit',
            second: '2-digit'
        };

        //   return now.toLocaleString('en-us' , options)

        return new Date().getTime();

    },


    /**
     * Saves the dynamically generated random data along with the timestamp in csv file
     * @param {String} textToSave - The concatinated tex to save.
     */

    saveInputToCsv: (textToSave, file) => {

        fs.appendFile(`${__dirname}/outputs/${file}`, textToSave + '\n', err => {

            if (!err) {

              //  console.log('Wrote to file')

            } else {

                console.log(err)

            }


        })



    }



}
