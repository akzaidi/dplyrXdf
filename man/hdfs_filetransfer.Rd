% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hdfs_filetransfer.R
\name{hdfs_upload}
\alias{hdfs_upload}
\alias{hdfs_download}
\title{Transfer files and directories to and from HDFS}
\usage{
hdfs_upload(src, dest, overwrite = FALSE, nativeTarget = "/tmp", ...)

hdfs_download(src, dest, overwrite = FALSE, nativeTarget = "/tmp", ...)
}
\arguments{
\item{src, dest}{Character strings giving the source and destination paths.}

\item{overwrite}{Whether to overwrite existing files at the destination.}

\item{nativeTarget}{Only when transferring to/from a remote client. The directory on the edge node in which to stage files.}

\item{...}{Other arguments to the Hadoop \code{copyFromLocal}/\code{copyToLocal} command.}
}
\value{
A logical value indicating whether the file transfer succeeded.
}
\description{
Transfer files and directories to and from HDFS
}
\details{
These functions transfer files and directories between the native filesystem and HDFS. \code{hdfs_upload} copies files from the native filesystem into HDFS, and \code{hdfs_download} does the reverse. They can be used both from the edge node of a Hadoop/Spark cluster, and from a remote client. In the latter case, the transfer is a two-stage process: for downloading, the files are copied to the edge node in the directory given by \code{nativeTarget}, and then copied to the client; and vice-versa for uploading.

Note that renaming directories as part of the transfer is supported for downloading from HDFS, but not for uploading.
}
\seealso{
\code{\link{download.file}}, \code{\link{rxHadoopCopyFromLocal}}, \code{\link{rxHadoopCopyFromClient}}
}
