
require 'rspec'

require_relative 'cookie'

describe Cookie do

  let(:type)   { "peanut butter" }
  let(:cookie) { Cookie.new(type) }

  describe "#initialize" do
    context "with valid input" do
      it "creates a new Cookie of the specified type" do
        expect(cookie.type).to eq(type)
      end
    end

    context "with invalid input" do
      it "throws an argument error when not given a type argument" do
        expect { Cookie.new }.to raise_error(ArgumentError)

      end
    end
  end

  describe "#type" do
    it "returns the type of the cookie" do
      expect(cookie.type).to eq(type)
    end

  end

  describe "#bake!" do
    it "requires an integer time argument" do
      time = 3
      expect { cookie.bake!(time) }.to_not raise_error()
    end

    it "raises an error if non-integer time argument given" do
      time = "haha"
      expect { cookie.bake!(time) }.to raise_error("please pass an integer argument")
    end


    it "returns the cookie object" do
      expect(cookie.bake!(1)).to be_a_kind_of(Cookie)
    end


    it "changes the status of the cookie when given enough time" do
      # expect { cookie.bake!(10) }.to change(cookie, :status).to(:ready)
      expect(cookie.bake!(10).status).to eql(:ready)
    end
  end

  describe "#status" do
    it "returns the cookie's current status" do
      expect(cookie.status).to eql(:doughy)
    end


    context "when unbaked" do
      it "is `:doughy`" do
        expect(cookie.status).to eql(:doughy)
      end

    end

    context "when baked for less than 7 minutes" do
      it "is `:doughy`" do
        expect(cookie.bake!(6).status).to eql(:doughy)
      end

    end

    context "when baked for at least 7 but less than 10 minutes" do
      it "is `:almost_ready`" do
        expect(cookie.bake!(8).status).to eql(:almost_ready)
      end

    end

    context "when baked for at least 10 but less than 12 minutes" do
      it "is `:ready`" do
        expect(cookie.bake!(11).status).to eql(:ready)
      end

    end

    context "when baked for at least 12 minutes" do
      it "is `:burned`" do
        expect(cookie.bake!(15).status).to eql(:burned)
      end

    end
  end
end
