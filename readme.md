### npm init --y
### npm i -D typescript
### npx tsc --init

### npm install -D @types/node

### npm i express
### npm i --save-dev @types/express

### tsconfig.js:
* uncomment: 
"rootDir": "./src",
"outDir": "./dist",
"lib": ["esnext"],
"types": ["node"],

* comment:
// "types": [],
// "jsx": "react-jsx",

* create src folder and into it create server.ts

### npm i -D tsx
* package.json file: into scripts, add:
"dev": "tsx watch './src/server.ts",
