const ffi = require('ffi');
const { types } = require('ref');

const PointerType = 'pointer';

const buildFolder = process.argv.slice(2)[0];

// Define the API mapping
const api = ffi.Library(`${buildFolder}/lib/libcdraaloptions.so`, {
    CDraalOpenOptions: [PointerType, []],
    CDraalCloseOptions: [types.void, [PointerType]]
});

// Open handle
const handle = api.CDraalOpenOptions();

console.log('Options handle', handle);

// Close handle
api.CDraalCloseOptions(handle);
