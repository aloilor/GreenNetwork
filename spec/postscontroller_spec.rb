require 'rails_helper.rb'
describe PostsController, type: :controller do
  
    fixtures :all

    before(:all) do
		Post.all.each do |ps|
			ps.destroy
		end
	end

    it "Should give me one post from fixtures" do
        banned= users(:banned)
        sign_in banned
        get :index
        expect(assigns(:posts).size).to eql(1)
    end

    #Banned User
    context "with Banned privileges" do
        before :each do
            banned = users(:banned)
            sign_in banned
        end
        #Create
        it "should not create posts" do
            params = {:post=>{:title => "Title", :description => "Description", :tag => "Tag", :position => "Position"}}
            get :create, :params => params
            p_tst= Post.where(:title => "Title")
            expect(p_tst).to be_empty
        end
        #Retrieve (= Show)
        it "should retrieve posts" do
            ps = posts(:one)
            params = {:id => ps.id}
            get :show, :params => params
            expect(assigns(:post)).to eql(ps)
        end
        #Update
        it "should not update posts" do
            ps = posts(:one)
            params = {:id => ps.id, :post=>{:title => "Title"}}
            get :update, :params => params
            p_tst= Post.find(ps.id)
            expect(p_tst.title).to eql(ps.title)
        end
        #Destroy
        it "should not destroy posts" do
            ps = posts(:one)
            params = {:id => ps.id}
            get :destroy, :params => params
            p_tst= Post.where(:id => ps.id)
            expect(p_tst).not_to be_empty
        end
    end

    #Admins
    context "with Admin privileges" do
        before :each do
            admin = users(:admin)
            sign_in admin
        end
        #Create
        it "should create posts" do
            params = {:post=>{:title => "Title", :description => "Description", :tag => "Tag", :position => "Position"}}
            get :create, :params => params
            p_tst = Post.where(:title => "Title")
            expect(p_tst).not_to be_empty
        end

        #Update
        it "should update posts" do
            ps = posts(:one)
            params = {:id => ps.id, :post=>{:title => "Title"}}
            get :update, :params => params
            p_tst = Post.find(ps.id)
            expect(p_tst.title).to eql(ps.title)
        end

        #Retrieve (= Show)
        it "should retrieve posts" do
        ps = posts(:one)
        params = {:id => ps.id}
        get :show, :params => params
        expect(assigns(:post)).to eql(ps)
        end
        
        #Delete
        it "should destroy posts" do
            ps = posts(:one)
            params = {:id => ps.id}
            get :destroy, :params => params
            p_tst = Post.where(:id => ps.id)
            expect(p_tst).to be_empty
        end
        
    end

end
