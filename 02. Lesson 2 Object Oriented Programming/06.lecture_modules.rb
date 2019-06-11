Lecture: Modules
One of the downsides of inheritance is that a class can only sub-class from one super class. In some situations, this limitation makes it very difficult to accurately model the problem domain. For example, suppose we have a new pet animal called Fish. These are pets that can swim, and have other characteristics like living in a small bowl, etc. They also can't run or jump, which are methods in our Pet class. Obviously, given this new information, some reorganizing of methods is required. How about something like this:



This seems fine, except we have swim in both the Dog class as well as the Fish class (the swim in Bulldog, remember, is to override the one in Dog, and therefore performs a different functionality). We'd like to not have the same swim method in two different classes, but where do we move it to? In Ruby, as in many other languages, you can only sub-class from one parent class.

This is the classical question of how a language should support multiple inheritance, and Ruby's answer is by way of mixing in behaviors. A class can only sub-class from one parent, but it can mix in as many modules as it likes.

The solution is to create a module, called Swim, and mix in that module in the appropriate classes.

module Swim
  def swim
    "swimming!"
  end
end

class Dog
  include Swim
  # ... rest of class omitted
end

class Fish
  include Swim
  # ... rest of class omitted
end
The result is that all the instance methods defined in the Swim module are now ready for use in the Dog and Fish classes. It's as if we copied and pasted the methods right in. We can also mix in as many modules as we need to. Mixing in modules, though, does affect the method lookup path. Use the .ancestors method to see how mixing in various modules affects how Ruby looks up methods.