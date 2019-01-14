const ffi = require('ffi');
const { types } = require('ref');

const Pointer = 'pointer';

const buildFolder = process.argv.slice(2)[0];

// Define the API mapping
const api = ffi.Library(`${buildFolder}/lib/libcdraaloptions.so`, {
    CDraalOpenOptions: [Pointer, []],
    CDraalCloseOptions: [types.void, [Pointer]]
});

// Open handle
const handle = api.CDraalOpenOptions();

console.log('Options handle', handle);

// Close handle
api.CDraalCloseOptions(handle);
