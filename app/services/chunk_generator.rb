class ChunkGenerator
  def self.roomlists_chunk(room)
    <<~TEXT
      ルームタイプ: #{room.room_type_name}
      サイズ: #{room.square_meters} sqm
      容量: #{room.capacity} guests
      ベッドタイプ: #{room.bed_type}
      ベッド数: #{room.bed_quantity}
      HTWN: #{room.htwn ? 'Yes' : 'No'}
      ルームカテゴリー: #{room.room_category.name}
      アメニティーグループ: #{room.amenity_group.name}
      アメニティーグループの詳細: #{room.amenity_group.content}
    TEXT
  end

  def self.amenitygroups_chunk(amenity)
    <<~TEXT
      アメニティーグループ: #{amenity.name}
      アメニティーの詳細: #{amenity.content}
    TEXT
  end

  def self.roomcategories_chunk(category)
    <<~TEXT
      ルームカテゴリー: #{category.name}
    TEXT
  end

  def self.facilities_chunk(facility)
    <<~TEXT
      施設名: #{facility.name}
      営業時間: #{facility.open_time} - #{facility.close_time}
      説明: #{facility.note}
    TEXT
  end
end
