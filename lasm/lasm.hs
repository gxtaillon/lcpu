import Data.Int (Int8)
import Data.Text (Text)

{-
    All `size`s indicate width in bits of said field.
-}

data Register = Register
    { registerName :: Text
    , registerSize :: Int8
    } deriving (Show)

data ControlLine = ControlLine 
    { controlLineName :: Text
    , controlLineSize :: Int8
    } deriving (Show)

data InstructionFormatPattern = 
    InstructionFormatRegister
    { instructionFormatRegisterName :: Register
    }
  | InstructionFormatHigh
  | InstructionFormatImmediate
    { instructionFormatImmediateValue :: Int
    , instructionFormatImmediateSize :: Int8
    } deriving (Show)

data InstructionFormat = InstructionFormat
    { instructionFormatName :: Text
    -- [(Pattern, Index)]
    , instructionFormatPatterns :: [(InstructionFormatPattern, Int8)] 
    } deriving (Show)

data ControlInstruction = ControlInstruction
    { controlInstructionName :: Text
    , controlInstructionFormat :: InstructionFormat
    -- [(Line, Value)]
    , controlInstructionLines :: [(ControlLine, Int)] 
    } deriving (Show)
    
data ControlStatement = ControlStatement
    { controlStatementName :: Text
    , controlStatementFormat :: InstructionFormat
    } deriving (Show)

data InstructionPattern = InstructionPattern
    { instructionPatternRequiresParentheses :: Bool
    , instructionPatternFormatPattern :: InstructionFormatPattern
    } deriving (Show)

data Instruction = Instruction
    { instructionName :: Text
    , instructionPatterns :: [InstructionPattern]
    , instructionControlInstructions :: [ControlInstruction]
    } deriving (Show)
    
data ASM = ASM
    { asmFormat :: Text
    , asmRegisterSize :: Int8
    , asmRegisters :: [Register]
    , asmLineSize :: Int8
    , asmLines :: [ControlLine]
    , asmInstSize :: Int8
    , asmInstFormats :: [InstructionFormat]
    , asmControlSize :: Int8
    , asmControlInstructions :: [ControlInstruction]
    , asmControlStatements :: [ControlStatement]
    , asmInstructions :: [Instruction]
    } deriving (Show)

data Program = Program
    { programAsm :: ASM
    , programImage :: [Int]
    , programRomImage :: [Int]
    } deriving (Show)

