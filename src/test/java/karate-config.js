function fn(){

var env = karate.env;
karate.log('karate.env value is: , env');

var config = {
    env : env,
    userName : 'Ertugrul',
    password : 'ert123',
    appUrl : 'https://jsonplaceholder.typicode.com'

}

return config;
}