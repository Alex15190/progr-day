{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_progr_day (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/user/Library/Haskell/bin"
libdir     = "/Users/user/Library/Haskell/ghc-8.4.3-x86_64/lib/progr-day-0.1.0.0"
dynlibdir  = "/Users/user/Library/Haskell/ghc-8.4.3-x86_64/lib/x86_64-osx-ghc-8.4.3"
datadir    = "/Users/user/Library/Haskell/share/ghc-8.4.3-x86_64/progr-day-0.1.0.0"
libexecdir = "/Users/user/Library/Haskell/libexec/x86_64-osx-ghc-8.4.3/progr-day-0.1.0.0"
sysconfdir = "/Users/user/Library/Haskell/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "progr_day_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "progr_day_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "progr_day_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "progr_day_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "progr_day_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "progr_day_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
