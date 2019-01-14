const ffi = require('ffi');

// Define the API
const api = ffi.Library('build/lib/libcdraaloptions.so', {
    CDraalOpenOptions: ['pointer', []],
    CDraalCloseOptions: ['void', ['pointer']]
});

// Open handle
const handle = api.CDraalOpenOptions();

console.log('Options handle', handle);

// Close handle
api.CDraalCloseOptions(handle);
