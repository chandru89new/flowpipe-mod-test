pipeline "simple" {
    description = "A simple pipeline with my name: ${var.my_name}"

    step "transform" "echo" {
        value = "Hello World ${var.my_name}"

        output "echo_1" {
            value = "echo 1"
        }

        output "echo_2" {
            value = "echo 2"
        }
    }

    output "val" {
        value = step.transform.echo.value
    }
}

pipeline "simple2" {
    step "transform" "echo" {
        value = "echo"
    }

    step "transform" "echo_2" {
        value = "echo 2"
    }

    step "transform" "echo_3" {
        depends_on = [step.transform.echo, step.transform.echo_2]
        value = "echo 3"
    }

    output "val" {
        value = step.transform.echo_3.value
    }
}

pipeline "enum_param" {

    param "string_param" {
        type = string
        default = "value1"
        enum = ["value1", "value2", "value3"]
        tags = {
            "tag3" = "value3"
            "tag4" = "value4"
        }
    }

    param "num_param" {
        type = number
        default = 1
        enum = [1, 2, 3]
        tags = {
            "tag5" = "value5"
            "tag6" = "value6"
        }
    }

    param "list_of_string_param" {
        type = list(string)
        default = ["value1", "value2"]
        enum = ["value1", "value2", "value3"]
        tags = {
            "tag7" = "value7"
            "tag8" = "value8"
        }
    }

    step "transform" "echo" {
        value = "${param.string_param}"
    }

    step "transform" "echo_2" {
        value = "${param.num_param}"
    }

    step "transform" "echo_3" {
        value = "${param.list_of_string_param}"
    }
}
