if_app_needs_recipe("unicorn") do |app,data,index|

  app_type = (data[:type] == 'rails' ? 'rails' : 'rack')

  unicorn_instance_count = 3

  template "/data/#{app}/shared/config/unicorn.rb" do
    owner node[:owner_name]
    group node[:owner_name]
    mode 0644
    variables({
      :unicorn_instance_count => unicorn_instance_count,
      :app => app,
      :type => app_type,
      :user => node[:owner_name]
    })
    source "unicorn.rb.erb"
  end

end
