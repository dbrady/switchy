describe "Everything Spec" do
  it "should pass 42" do
    sleep 0.2
    42.should == 42
  end
  
  it "should pass 13" do
    sleep 0.2
    13.should == 13
  end
  
  it "should pass 69" do
    sleep 0.2
    69.should == 69
  end
  
  it "should pass 7" do
    sleep 0.2
    7.should == 7
  end

  it "should pass 142" do
    sleep 0.2
    142.should == 142
  end
  
  it "should pass 113" do
    sleep 0.2
    113.should == 113
  end
  
  it "should pass 169" do
    sleep 0.2
    169.should == 169
  end
  
  it "should pass 17" do
    sleep 0.2
    17.should == 17
  end
  
  it "should pending 42" do
    sleep 0.2
    pending "42"
  end
  
  it "should pending 13" do
    sleep 0.2
    pending "13"
  end
  
  it "should pending 69" do
    sleep 0.2
    pending "69"
  end
  
  it "should pending 7" do
    sleep 0.2
    pending "7"
  end

  it "should pending 142" do
    sleep 0.2
    pending "142"
  end
  
  it "should pending 113" do
    sleep 0.2
    pending "113"
  end
  
  it "should pending 169" do
    sleep 0.2
    pending "169"
  end
  
  it "should pending 17" do
    sleep 0.2
    pending "17"
  end

  it "should fail 42" do
    sleep 0.2
    42.should == 43
  end
  
  it "should fail 13" do
    sleep 0.2
    13.should == 14
  end
  
  it "should fail 69" do
    sleep 0.2
    69.should == 70
  end
  
  it "should fail 7" do
    sleep 0.2
    7.should == 8
  end

  it "should fail 142" do
    sleep 0.2
    142.should == 143
  end
  
  it "should fail 113" do
    sleep 0.2
    113.should == 114
  end
  
  it "should fail 169" do
    sleep 0.2
    169.should == 170
  end
  
  it "should fail 17" do
    sleep 0.2
    17.should == 18
  end
  
end
