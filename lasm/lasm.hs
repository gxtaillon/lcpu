import Data.Int (Int8)
import Data.Text (Text)

data Register = Register
    { name :: Text
    } deriving (Show)

data ControlLine = ControlLine 
    { name :: Text
    , size :: Int8
    } deriving (Show)

data InstructionFormatRegister = 
    InstructionFormatRegister
    { registerPatterns :: [(Register, Int8)] -- Register, Index
    , highPatterns :: [Int8] -- ones index
    , controlPattern :: Int8
    -- rest is filled with zeros
    } deriving (Show)
data InstructionFormatImmediate
    { value :: Int
    , index :: Int8
    , size :: Int8
    } deriving (Show)

data InstructionFormat = InstructionFormat
    { name :: Text
    , 

data Program = Program 
    { format :: Text
    , regSize :: Int8
    , regs :: [Register]
    , lineSize :: Int8
    , lines :: [ControlLine]
    , instFormatSize :: Int8
    , 

