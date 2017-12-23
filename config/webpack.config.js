const CleanWebpackPlugin = require('clean-webpack-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const path = require('path');

module.exports = {
    context : process.cwd(),
    entry : ['babel-polyfill',
            'react-hot-loader/patch',
            "./main.js"],
    output : {
        path : process.cwd() + "/dist",
        filename : "[name].bundle.js"
    },
    module :{
        rules : [
            {
                test: /\.js$/,
                exclude: /(node_modules)/,
                use: {
                    loader: 'babel-loader',
                }
            }
        ]
    },

    plugins: [
        new CleanWebpackPlugin(['dist'], {watch: true, root: process.cwd()} ),
        new HtmlWebpackPlugin({title: 'Enterprise Blockchain'})
    ],

    devServer: {
        contentBase: path.join(__dirname, "dist"),
        compress: true,
        port: 8080
    }
}