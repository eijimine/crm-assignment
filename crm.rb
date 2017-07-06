require_relative 'contact.rb'

class CRM



  def initialize

  end

  def main_menu
    while true # repeat indefinitely
       print_main_menu
       user_selected = gets.to_i
       call_option(user_selected)
     end
  end

  def print_main_menu
     puts '[1] Add a new contact'
     puts '[2] Modify an existing contact'
     puts '[3] Delete a contact'
     puts '[4] Display all the contacts'
     puts '[5] Search by attribute'
     puts '[6] Exit'
     puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
     when 1 then add_new_contact
     when 2 then modify_existing_contact
     when 3 then delete_contact
     when 4 then display_all_contacts
     when 5 then search_by_attribute
     when 6 then exit
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact

    print "Who's contact would you like to modify?"
    print "Please enter their first name: "
    name = gets.chomp


    print "Which attribute would you like to change?"
    attribute = gets.chomp

    print "What would you like to change it to?"
    value = gets.chomp

    contacts = Contact.find_by('first_name', name)
    new_contact = contacts[0]
    if new_contact == nil
      puts "Invalid entry, please start again."
      main_menu
    else
    new_contact.update(attribute, value)
  end
  end

  def delete_contact
    print "Please enter the name of contact you would like to delete: "
    name = gets.chomp


    contacts = Contact.find_by('first_name', name)
    new_contact = contacts[0]
    if new_contact == nil
      puts "Invalid entry, please start again."
      main_menu
    else
    new_contact.delete
  end
  end

  def display_all_contacts
    display = Contact.all.inspect
    puts display
  end

  def search_by_attribute
    print "Please enter the attribute then the value to search by: "
    attribute = gets.chomp
    value = gets.chomp

    contacts = Contact.find_by(attribute, value)
    contacts.each do |contact|
      puts "Contact info: #{contact.inspect}."
    end
  end


end
