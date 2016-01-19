{-# LANGUAGE TypeOperators, TypeFamilies, MultiParamTypeClasses, CPP #-}
{-# OPTIONS_GHC -Wall #-}

-- {-# OPTIONS_GHC -fno-warn-unused-imports #-} -- TEMP
-- {-# OPTIONS_GHC -fno-warn-unused-binds   #-} -- TEMP

----------------------------------------------------------------------
-- |
-- Module      :  ReifyCore.Misc
-- Copyright   :  (c) 2013 Tabula Inc and 2016 Conal Elliott
-- License     :  BSD3
-- 
-- Maintainer  :  conal@tabula.com
-- Stability   :  experimental
-- 
-- Miscellany
----------------------------------------------------------------------

module ReifyCore.Misc
  ( module Circat.Misc
  , Eq1'(..), (===?)
  ) where

import Unsafe.Coerce (unsafeCoerce)     -- see below

import Data.Proof.EQ ((:=:)(..))

import Circat.Misc

-- | Equality when we don't know that the type parameters match.
class Eq1' f where
  (====) :: f a -> f b -> Bool

-- | Test for equality. If equal, generate a type equality proof. The proof
-- generation is done with @unsafeCoerce@, so it's very important that equal
-- terms really do have the same type.
(===?) :: Eq1' f => f a -> f b -> Maybe (a :=: b)
a ===? b | a ==== b  = unsafeCoerce (Just Refl)
         | otherwise = Nothing

-- TODO: Maybe eliminate Eq' and ==?. If so, rename (====) and (===?).

-- TODO: Get Eq1 from Data.Functor.Classes from the transformers package.