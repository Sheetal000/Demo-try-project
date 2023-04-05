class HelloWorker
    include Sidekiq::Worker
  
    def perform(*args)
      c = Category.new(name: "java",description: "is good language")
      c.save
  
    end
  
end