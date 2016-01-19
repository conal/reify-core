-- {-# LANGUAGE #-}
{-# OPTIONS_GHC -Wall #-}

-- {-# OPTIONS_GHC -fno-warn-unused-imports #-} -- TEMP
-- {-# OPTIONS_GHC -fno-warn-unused-binds   #-} -- TEMP

----------------------------------------------------------------------
-- |
-- Module      :  ReifyCore.Interactive
-- Copyright   :  (c) 2016 Conal Elliott
-- License     :  BSD3
--
-- Maintainer  :  conal@conal.net
-- Stability   :  experimental
-- 
-- Interactive HERMIT-based plugin
----------------------------------------------------------------------

module ReifyCore.Interactive where

-- TODO: explicit exports

import GhcPlugins (Plugin)
import HERMIT.Plugin (hermitPlugin,pass,interactive)

import qualified Monomorph.Stuff as Mo

import ReifyCore.Reify (externals)

plugin :: Plugin
plugin = hermitPlugin (pass 0 . interactive (externals ++ Mo.externals))
