-- {-# OPTIONS_GHC -fplugin=Monomorph.Plugin -O -fobject-code -dcore-lint #-}

{-# OPTIONS_GHC -fforce-recomp -fplugin=ReifyCore.Plugin -O -fobject-code -dcore-lint #-}

{-# LANGUAGE CPP, TupleSections, GADTs, TypeOperators, Rank2Types #-}
{-# OPTIONS_GHC -Wall #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-} -- TEMP
-- {-# OPTIONS_GHC -fno-warn-unused-binds   #-} -- TEMP
{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

----------------------------------------------------------------------
-- |
-- Module      :  Examples
-- Copyright   :  (c) 2016 Conal Elliott
-- License     :  BSD3
--
-- Maintainer  :  conal@conal.net
-- Stability   :  experimental
-- 
-- Examples / tinkering.
----------------------------------------------------------------------

module Examples where

-- Oddly, this import breaks unfolding needed by monomorphize.
import ReifyCore.Lambda (EP,reifyEP)

-- -- So does this one.
-- import ReifyCore.Lambda ()

-- -- This one is okay.
-- import ReifyCore.Reify ()

-- import ReifyCore.Reify (externals)

-- import ReifyCore.Sham ()

import Data.Monoid (Sum(..))
import Control.Applicative (liftA2)

import TypeUnary.Vec

import Circat.Misc (Unop,Binop)
import Circat.Rep
import Circat.Pair
import Circat.RTree

-- t1 :: RTree N1 Int
-- t1 = B (L 3 :# L 4)

-- q1 = reifyEP (\ x -> x + 0 :: Int)

-- -- In ghci: "ghc: panic! (the 'impossible' happened) ... floatExpr tick break<0>()"
-- boodly = "boodly"

sumv4 = reifyEP (sum ::  Vec N4 Int -> Int)
sumt4 = reifyEP (sum :: Tree N4 Int -> Int)
