#encoding:utf-8
HeadOrganization.create!(name:"kosea", facebook_page:"")
Organization.create!(name:"headflow",head_organization_id: 1,facebook_page:"")
Team.create!(name:"트루빈스",organization_id: 1, leader_user_id: 1, bank_branch: "신한은행" , account_number: "110-12-123-124234",facebook_page:"")
Category.create!(name: "활동비")
Item.create!(name: "여비", category_id: 1)
# Admin.create!(email: "admin@headflow.net", password: "dudtlr")
# User.create!(email: "user@headflow.net", password: "dudtlr", status: "user-approved", team_id: 1)
# User.create!(email: "mentor@headflow.net", password: "dudtlr", status: "mentor-approved", organization_id: 1)
