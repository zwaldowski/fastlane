describe Fastlane do
  describe Fastlane::FastFile do
    describe "Jazzy" do
      it "default use case" do
        result = Fastlane::FastFile.new.parse("lane :test do
          jazzy
        end").runner.execute(:test)

        expect(result).to eq("jazzy")
      end

      it "add config option" do
        result = Fastlane::FastFile.new.parse("lane :test do
          jazzy(
            config: '.jazzy.yaml'
          )
        end").runner.execute(:test)

        expect(result).to eq("jazzy --config .jazzy.yaml")
      end

      it "add skip documentation option" do
        result = Fastlane::FastFile.new.parse("lane :test do
          jazzy(
            skip_documentation: true
          )
        end").runner.execute(:test)

        expect(result).to eq("jazzy --skip-documentation")
      end
    end
  end
end
