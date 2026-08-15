resource "aws_s3_bucket" "bucket1" {
    count = length(var.bucket_names)
    bucket = var.bucket_names[count.index]
    tags = var.tags
}


resource "aws_s3_bucket" "bucket2" {
    for_each = var.bucket_name_set
    # for_each will work on set and map as well
    # when using on map we will need to use each.value 
    bucket =  each.key
    tags = var.tags

    # if depends_on is not used then resources are created into any order but if we want to create resources in order
    # then we can use depends_on 
    # and using this first bucket1 will be created and then bucket2
    depends_on = [aws_s3_bucket.bucket1]
}