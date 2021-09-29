class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

    validates :custom_validation?

    
    NO_USE = [/Won't Believe/i,/Secret/i,/Top \d/i,/Guess/i]
    
    def custom_validation?
        
        if NO_USE.none? {|no_use| no_use.match title}
            errors.add(:title, "must be clickbait")
            
        end
        
    end
end


# class Person
#     validate :must_have_flatiron_email

#     def must_have_flatiron_email
#       unless email.match?(/flatironschool.com/)
#         errors.add(:email, "We're only allowed to have people who work for the company in the database!")
#       end
# def clickbait   
#     bait = ["Won't Believe", "Secret", "Top 5", "Guess"]
#     bait.map { |bait_words|        
#         if :title.to_s.in?(bait_words)
#             # byebug
#             return true
#         else
            
#             errors.add(:title, "not bait")
#         end
#     }

# end
#     end
#   end 
  