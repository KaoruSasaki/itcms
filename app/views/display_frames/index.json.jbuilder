json.array!(@display_frames) do |display_frame|
  json.extract! display_frame, :id
  json.url display_frame_url(display_frame, format: :json)
end
