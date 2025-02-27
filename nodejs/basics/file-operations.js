const fs = require('fs');

fileContent = 'Hello, World!';
filePath = '/tmp/nodejs/test.txt';

fileComponents = filePath.split('/');
fileName = fileComponents.pop();
fileDir = fileComponents.join('/');

console.log('Path:', filePath);
console.log('File name:', fileName);
console.log('File directory:', fileDir);

// Create a directory
fs.mkdirSync(fileDir, { recursive: true });

// Create a file
fs.writeFileSync(filePath, fileContent);

// Read a file
readContent = fs.readFileSync(filePath, 'utf8');
console.log('Read content:', readContent);
