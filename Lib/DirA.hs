-------------------------------------------------------------------
--
-- Module      :    a sub 
------------------------------------------------------------------- 
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE ScopedTypeVariables   #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE TypeSynonymInstances  #-}
{-# LANGUAGE OverloadedStrings     #-}

{-# OPTIONS_GHC -Wno-unused-imports #-}
{-# OPTIONS_GHC -Wno-missing-signatures #-}



module Lib.DirA   
     where
import Uniform.Strings 
import System.Process as Sys 
import Uniform.FileIO

aMain :: IO ()
aMain = do
    putStrLn "Lib.DirA here"
    return ()

extTex = Extension "tex"

writePDF2text ::   Path Abs File -> Path Abs File -> ErrIO ()
-- convert the text in the file given (a full latex) into a pdf 
-- in the second path 
writePDF2text  fn fnres = do
    -- -- check for locale 
    loc <- callIO $ Sys.callProcess "locale" []
    putIOwords ["writePDF2text locale "]

    -- process

    let infn = setExtension extTex fn :: Path Abs File
    putIOwords ["writePDF2text 1 infn", showT infn]
    let dir1 = getParentDir fnres :: FilePath
    let out1 = "--output-directory=" <> (dir1)
    putIOwords ["writePDF2text 2 out1", showT out1]
    callIO $ Sys.callProcess
        "lualatex"
        [out1, "-interaction=nonstopmode", toFilePath infn]
    return ()




