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

module ReifyCore.Plugin where

-- TODO: explicit exports

import Prelude hiding ((.))

import Control.Category ((.))
import GhcPlugins (Plugin)
import Language.KURE (tryR)
import HERMIT.Kernel (CommitMsg(..))
import HERMIT.Plugin

import Monomorph.Stuff (monomorphizeR)
import Monomorph.Plugin (tweakPretty)
import ReifyCore.Reify

plugin :: Plugin
plugin = hermitPlugin (pass 0 . const plug)
 where
   plug = tweakPretty >>
          apply (Always "reify-core") (tryR reifyR . tryR monomorphizeR)
