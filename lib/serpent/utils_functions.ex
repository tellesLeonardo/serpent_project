defmodule Serpent.UtilsFunctions do

  alias ExAws.S3

  def return_bucktes() do
    ExAws.S3.list_buckets()
    |> ExAws.request!()
    |> get_in([:body, :buckets])
  end

  def remove_object(bucket,name_obj) do
    S3.delete_object(bucket, name_obj)
    |> ExAws.request!()
  end


  def send_objetc(bucket, name_obj, path_obj) do
    path_obj
    |> S3.Upload.stream_file
    |> S3.upload(bucket, "images/#{name_obj}")
    |> ExAws.request
  end

  def get_object(bucket,name_file) do
    S3.get_object(bucket, name_file) \
    |> ExAws.request!()
  end

  def list_objects(bucket \\ "uploadsfile") do
  S3.list_objects(bucket)
   |> ExAws.request!()
   |> get_in([:body, :contents])

  end

end
