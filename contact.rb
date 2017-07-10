
  gem "activerecord", "=4.2.9"
  require "active_record"
  require "mini_record"

  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

  class Contact < ActiveRecord::Base
  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

  # end


  # attr_reader :id
  # attr_accessor :first_nam, :last_name, :email, :notes #read and write variables
  #
  # @@contacts = []
  # @@id = 1000
  #
  #
  # # This method should initialize the contact's attributes
  # def initialize(first_name, last_name, email, notes)
  #   @first_name = first_name
  #   @last_name = last_name
  #   @email = email
  #   @notes = notes
  #
  #   @id = @@id
  #   @@id += 1
  # end
  #
  # # This method should call the initializer,
  # # store the newly created contact, and then return it
  # def self.create(first_name, last_name, email, notes)
  #   new_contact = Contact.new(first_name, last_name, email, notes)
  #   @@contacts << new_contact
  #   new_contact
  # end
  #
  # # This method should return all of the existing contacts
  # def self.all
  #   return @@contacts
  # end
  #
  # # This method should accept an id as an argument
  # # and return the contact who has that id
  # def self.find(id_num)
  #     @@contacts.each do |ar|
  #       if ar.id == id_num
  #         return ar
  #     end
  #   end
  # end
  #
  # # This method should allow you to specify
  # # 1. which of the contact's attributes you want to update
  # # 2. the new value for that attribute
  # # and then make the appropriate change to the contact
  # def update(attribute, value)
  #   if attribute == 'first_name'
  #       self.first_name = value
  #
  #   elsif attribute == 'last_name'
  #         self.last_name = value
  #
  #   elsif attribute == 'email'
  #         self.email = value
  #
  #   elsif attribute == 'note'
  #         self.note = value
  #
  #   end
  #
  # end
  #
  # # This method should work similarly to the find method above
  # # but it should allow you to search for a contact using attributes other than id
  # # by specifying both the name of the attribute and the value
  # # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  #
  # # var.send(attribute) = Black magic
  #
  # # def self.find_by(attribute, value)
  # #     if attribute == 'first_name'
  # #       @@contacts.each do |var|
  # #         if var.first_name == name
  # #         return var
  # #          end
  # #         end
  # #
  # #
  # #     elsif attribute == 'last_name'
  # #       @@contacts.each do |var|
  # #         if var.last_name == value
  # #           return var
  # #         end
  # #       end
  # #
  # #
  # #     elsif attribute == 'email'
  # #       @@contacts.each do |var|
  # #         if var.email == value
  # #           return var
  # #         end
  # #       end
  # #     end
  # # end
  #
  #   def self.find_by(attribute, value)
  #     matched_contacts = []
  #     if attribute == 'first_name'
  #       @@contacts.each do |current_contact|
  #         if current_contact.first_name == value
  #           matched_contacts << current_contact
  #         end
  #       end
  #     elsif attribute == 'last_name'
  #       @@contacts.each do |current_contact|
  #         if current_contact.last_name == value
  #           matched_contacts << current_contact
  #         end
  #       end
  #     elsif attribute == 'email'
  #       @@contacts.each do |current_contact|
  #         if current_contact.last_name == value
  #           matched_contacts << current_contact
  #         end
  #       end
  #     end
  #     return matched_contacts
  #   end
  #
  # # This method should delete all of the contacts
  # def self.delete_all
  #   @@contacts.clear
  # end
  #
  def full_name
    "#{first_name} #{ last_name}"
  end
  #
  # # This method should delete the contact
  # # HINT: Check the Array class docs for built-in methods that might be useful here
  # def delete
  #   @@contacts.delete(self)
  # end
  #
  # # Feel free to add other methods here, if you need them.
  #

  at_exit do
    ActiveRecord::Base.connection.close
  end

end

Contact.auto_upgrade!


# jen = Contact.create('Jen', 'Lopez', 'jlo@gmail.com')
# clark = Contact.create('Clark', 'Kent', 'Clark@gmail.com')
# joe = Contact.create('Joe', 'Smith', 'joe@gmail.com')
# joe = Contact.create('Joe', 'Smith', 'joe@gmail.com')
