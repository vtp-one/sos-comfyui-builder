variable "NAMESPACE" {
    default = "sos/comfyui"
}

variable "VERSION" {
    default = "0.0.0"
}

variable "CONTEXT_ROOT" {
    default = ""
}

variable "PLATFORM" {
    default = ""
}

variable "COMFYUI_WORKING_DIR" {
    default = ""
}


group "default" {
    targets = [
    "application",
    ]
}

target "application" {
    dockerfile = "Dockerfile"
    tags = ["${NAMESPACE}/application:${VERSION}"]
    context = "${CONTEXT_ROOT}/docker/application/${PLATFORM}"
    contexts = {
        comfyui = "${COMFYUI_WORKING_DIR}"
    }
    target = "runtime"
}
