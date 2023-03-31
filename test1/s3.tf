resource "aws_s3_bucket" "test"{
   bucket ="terraform101-kibeom"
   tags = {
     Name = "kibeomkim-test"
   }
}
