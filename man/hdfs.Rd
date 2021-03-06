% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hdfs_utils.R
\name{hdfs_dir}
\alias{hdfs_dir}
\alias{print.dplyrXdf_hdfs_dir}
\alias{hdfs_dir_exists}
\alias{hdfs_file_exists}
\alias{hdfs_dir_create}
\alias{hdfs_dir_remove}
\alias{hdfs_file_copy}
\alias{hdfs_file_move}
\alias{hdfs_file_remove}
\alias{hdfs_expunge}
\alias{in_hdfs}
\title{Utilities for HDFS}
\usage{
hdfs_dir(path = ".", ..., full_path = FALSE, include_dirs = FALSE,
  recursive = FALSE, dirs_only = FALSE, pattern = NULL,
  convert_backslashes = TRUE)

\method{print}{dplyrXdf_hdfs_dir}(x, ...)

hdfs_dir_exists(path, convert_backslashes = TRUE)

hdfs_file_exists(path, convert_backslashes = TRUE)

hdfs_dir_create(path, ..., convert_backslashes = TRUE)

hdfs_dir_remove(path, ..., convert_backslashes = TRUE)

hdfs_file_copy(src, dest, ..., convert_backslashes = TRUE)

hdfs_file_move(src, dest, ..., convert_backslashes = TRUE)

hdfs_file_remove(path, ..., convert_backslashes = TRUE)

hdfs_expunge()

in_hdfs(obj = NULL)
}
\arguments{
\item{path}{A HDFS pathname.}

\item{...}{For \code{hdfs_dir}, further switches, prefixed by \code{"-"}, to pass to the Hadoop \code{fs -ls} command. For other functions, further arguments to pass to \code{\link{rxHadoopCommand.}}}

\item{full_path}{For \code{hdfs_dir}, whether to prepend the directory path to filenames to give a full path. If FALSE, only file names are returned.}

\item{include_dirs}{For \code{hdfs_dir}, if subdirectory names should be included. Always TRUE for non-recursive listings.}

\item{recursive}{For \code{hdfs_dir}, if the listing should recurse into subdirectories.}

\item{dirs_only}{For \code{hdfs_dir} if \emph{only} subdirectory names should be included.}

\item{pattern}{For \code{hdfs_dir}, an optional \link{regular expression}. Only file names that match will be returned.}

\item{convert_backslashes}{Whether to convert any backslashes found in the input to forward slashes.}

\item{src, dest}{For \code{hdfs_file_copy} and \code{hdfs_file_move}, the source and destination paths.}

\item{obj}{For \code{in_hdfs}, An R object, typically a RevoScaleR data source object.}
}
\value{
\code{hdfs_dir} returns a vector of filenames, optionally with the full path attached.

\code{hdfs_dir_exists} and \code{hdfs_file_exists} return TRUE or FALSE depending on whether the directory or file exists.

The other \code{hdfs_*} functions return TRUE or FALSE depending on whether the operation succeeded.

\code{in_hdfs} returns whether the given object is stored in HDFS. This will be TRUE for an Xdf data source or file data source in HDFS, or a Spark data source. Classes for the latter include \code{RxHiveData}, \code{RxParquetData} and \code{RxOrcData}. If no argument is specified, it returns whether the default filesystem is HDFS.
}
\description{
Functions for working with files in HDFS: directory listing; file copy, move and delete; directory create and delete; test for file/directory existence; check if in HDFS; expunge Trash.
}
\details{
These are utility functions to simplify working with files and directories in HDFS. For the most part, they wrap lower-level functions provided by RevoScaleR, which in turn wrap various Hadoop file system commands. They work with any file that is stored in HDFS, not just Xdf files.

The \code{hdfs_dir} function is analogous to \code{dir} for the native filesystem. Like that function, and unlike \code{\link{rxHadoopListFiles}}, it returns a vector of filenames (\code{rxHadoopListFiles} returns a vector of \emph{printed output} from the \code{hadoop fs -ls} command, which is not quite the same thing). Again unlike \code{rxHadoopListFiles}, it does not print anything by default (the \code{print} method takes care of that).

\code{hdfs_dir_exists} and \code{hdfs_file_exists} test for the existence of a given directory and file, respectively. They are analogous to \code{dir.exists} and \code{file.exists} for the native filesystem.

\code{hdfs_dir_create} and \code{hdfs_dir_remove} create and remove directories. They are analogous to \code{dir.create} and \code{unlink(recursive=TRUE)} for the native filesystem.

\code{hdfs_file_copy} and \code{hdfs_file_move} copy and move files. They are analogous to \code{file.copy} and \code{file.rename} for the native filesystem. Unlike \code{\link{rxHadoopCopy}} and \code{\link{rxHadoopMove}}, they are vectorised in both \code{src} and \code{dest}.

\code{hdfs_file_remove} deletes files. It is analogous to \code{file.remove} and \code{unlink} for the native filesystem.

\code{hdfs_expunge} empties the HDFS trash.
}
\seealso{
\code{\link{dir}}, \code{link{dir.exists}}, \code{\link{file.exists}}, \code{\link{dir.create}},
\code{\link{file.copy}}, \code{\link{file.rename}}, \code{\link{file.remove}}, \code{\link{unlink}},
\code{\link{rxHadoopListFiles}}, \code{\link{rxHadoopFileExists}},
\code{\link{rxHadoopMakeDir}}, \code{\link{rxHadoopRemoveDir}},
\code{\link{rxHadoopCopy}}, \code{\link{rxHadoopMove}}, \code{\link{rxHadoopRemove}}
}
