----------------------------------------------------------------

-- Module      :   a test  
----------------------------------------------------------------

{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE ScopedTypeVariables   #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE TypeSynonymInstances  #-}
{-# LANGUAGE OverloadedStrings     #-}

{-# OPTIONS_GHC -Wno-unused-imports #-}
{-# OPTIONS_GHC -Wno-missing-signatures #-}

module Main     where      -- must have Main (main) or Main where

 
import           Lib.DirA
import           Uniform.Error
import Uniform.FileIO

main :: IO ()
main =  do 
    res <- runErr mainErrIO 
    putIOwords ["result mainErrIO", showT res]
    return () 

mainErrIO :: ErrIO ()
mainErrIO = do
    putIOwords ["-------start"]
    bakeOneFile2pdf texFn2 pdfFn2 
    putIOwords ["-------end"]

texFn = makeAbsFile "/home/frank/Workspace8/ssg/docs/site/baked/Blog/SubBlog/testSort.tex"
pdfFn = makeAbsFile "/home/frank/Workspace8/ssg/docs/site/baked/Blog/SubBlog/testSort.pdf"
imgFp = "/home/frank/Workspace8/ssg/docs/site/dough/Blog/SubBlog/DSC08138.JPG"

texFn2 = makeAbsFile "/home/frank/Workspace8/minimalForTest/testSort.tex"
pdfFn2 = makeAbsFile "/home/frank/Workspace8/minimalForTest/testSort.pdf"
 

bakeOneFile2pdf ::   Path Abs File  -- ^ md file 
    -> Path Abs File
    -> ErrIO ()
-- convert tex to pdf 
bakeOneFile2pdf   inputFn  resfn2 = do
    putIOwords
        [ "\n-----------------"
        , "bakeOneFile2pdf 1 inputFn"
        , showT inputFn
        , "\n resfn2"
        , showT resfn2
        ]
                 
    -- writePDF2text ::   Path Abs File -> Path Abs File -> ErrIO ()
    writePDF2text   inputFn resfn2   -- content is html style

    putIOwords
        ["\n-----------------", "bakeOneFile2pdf done fn", showT resfn2]
    return ()  
