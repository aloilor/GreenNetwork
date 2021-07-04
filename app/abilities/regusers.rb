Canard::Abilities.for(:reguser) do
  can :manage, Comment
  
  can :manage, Post
  
end
