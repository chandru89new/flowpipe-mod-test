trigger "schedule" "my_hourly_trigger" {
    title = "My Hourly Trigger"
    description = "my hourly trigger."
    
    schedule = "hourly"

    pipeline = pipeline.echo
}

trigger "schedule" "my_daily_trigger" {
    schedule = "daily"
    title = "My daily trigger"
    pipeline = pipeline.echo
}

pipeline "echo" {
    title = "Echo pipeline",
    step "transform" "echo" {
        value = "Hello World"
    }
}