# Cryptolib - Common library for cryptocurrency trading

## Features
- [x] Common models for cryptocurrency trading
- [x] Common schemas for cryptocurrency trading
- [x] Common utilities for cryptocurrency trading
- [x] Cryptocurrency exchange API wrappers
- [x] Live data streamer with global scope / database support
- [x] SQL database files for intialization

## Installation

1. Navigate to the root directory of the project in which the application is run from.
2. Clone the repository or download the zip file and extract it into the directory.
3. Your done!

## Usage
Your project should now have access to the library. To use it, simply import the library into your project and use the functions as you would any other function.

Example:
```python
from cryptolib.model import *
from cryptolib.schema import *
from cryptolib.utils import *
from cryptolib.exchange import *
from cryptolib.enums import *
```

## Update Log
- 2023-06-10: Added database support to live streamer
    1. Need to fix the table and streamer for depth
    2. Planning to add in functionality for spread fee calculation; should be calculated in the depth streamer

