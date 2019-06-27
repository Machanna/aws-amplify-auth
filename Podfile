# Uncomment the next line to define a global platform for your project

 platform :ios, '9.0'

target 'Amplify2' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'AWSCore', '~> 2.9.6'
  pod 'AWSMobileClient', '~> 2.9.0'      # Required dependency
  pod 'AWSAuthUI', '~> 2.9.0'            # Optional dependency required to use drop-in UI
  pod 'AWSUserPoolsSignIn', '~> 2.9.9'
  pod 'AWSFacebookSignIn', '~> 2.9.9'
  pod 'AWSGoogleSignIn', '~> 2.9.9'     # Add this new dependency
  pod 'GoogleSignIn', '~> 4.0'

  # Pods for Amplify2

  target 'Amplify2Tests' do
    inherit! :search_paths
    # Pods for testing
  end

end
