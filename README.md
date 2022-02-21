# Containerized chainsaw

## Download

```console
$ docker pull docker.io/nisse123/chainsaw
```

## Usage

### Docker
```console
$ docker run -e (BLOB=<url_to_evtx_blob>|ZIP_URL=<url_to_zip>) --rm nisse123/chainsaw >> out.json
```
> Setting at least one of ZIP_URL or BLOB env vars is mandatory, or the container will return an error message.
>```console
>$ docker run nisse123/chainsaw
>Please run with blob or zip url 
>'docker run -e (ZIP_URL=<zip_download_url>|BLOB=<blob_url>) nisse123/chainsaw'
>```

### Kubernetes

```console
$ kubectl create -f ./chainsaw-pod.yaml
pod/my-chainsaw-5ml76 created

$ kubectl delete pod -l run=my-chainsaw
pod "my-chainsaw-5ml76" deleted
pod "my-chainsaw-j4572" deleted
pod "my-chainsaw-r6k8n" deleted
pod "my-chainsaw-vrlk2" deleted
```

## Expected input

BLOB var is expected to be a url to azure blob stoarge and will get called using azcopy
ZIP_URL var is expected to be a valid download url that will get downloaded with wget, and then unzipped.

Folder structure doesnt matter as 'find' will move the evtx files before chainsaw starts processing.

Naming on the logfiles, however matters. If you have several logfiles with the exact same name, they will get overwritten.
Consider naming your logfiles `<computer_name>-<log-name>.evtx`

## Expected output
A json-doc per line, per detection.
The container only outputs the json doc to stdout, while everything else is piped to stderr.  
Running the container manually you will see everything in the console,  
but piping the output to will only give you the json result from chainsaws run as the rest is treated as error messages.

## extra reading

**chainsaw repo**
https://github.com/countercept/chainsaw
