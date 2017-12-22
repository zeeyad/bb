class UserImport
  include ActiveModel::Model
  attr_accessor :file
  attr_accessor :user_id
  #attr_accessor :arr

  def initialize(attributes = {})
    attributes.each { |studreg, value| send("#{studreg}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_products == false
      return false
    end
    begin 
        imported_products.map(&:valid?).all?
          imported_products.each(&:save!)
          true
      rescue
        imported_products.each_with_index do |user, index|
          if user.valid?
            user.save
            #arr << user.studreg
            
          end

          user.errors.full_messages.each do |message|
            errors.add :base, "<strong>ERROR - Row #{index+2}: #{user.username} : #{message}</strong>".html_safe
          end
        end
        false
      end
    end

  def imported_products
    @imported_products ||= load_imported_products
  end

  def load_imported_products
    spreadsheet = Roo::Spreadsheet.open(file.path)

    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      user = User.find_by(id: row["id"]) || User.new
      begin 
        user.attributes = row.to_hash
      rescue
        return false
      end
      user.attributes = row.to_hash
      user
    end    
  end

end
