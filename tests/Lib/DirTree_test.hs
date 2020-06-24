-----------------------------------------------------------------------------
--
-- Module      :   a test  
-----------------------------------------------------------------------------
{-# OPTIONS_GHC -F -pgmF htfpp #-}

{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE ScopedTypeVariables   #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE TypeSynonymInstances  #-}
{-# LANGUAGE OverloadedStrings     #-}

module Lib.DirTree_test  -- (openMain, htf_thisModuelsTests)
     where


import Test.Framework
import Uniform.Strings

openMain :: IO ()
openMain = do
    return ()



-- show produces the "xx"
test_1 = assertEqual 7 8
test_2 = assertEqual 6 9




