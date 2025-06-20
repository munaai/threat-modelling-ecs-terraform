module.exports = {
    module: {
      rules: [
        {
          test: /\.js$/,
          enforce: 'pre',
          use: ['source-map-loader'],
          exclude: [/ace-builds/], // Exclude ace-builds from source maps
        },
      ],
    },
  };
  