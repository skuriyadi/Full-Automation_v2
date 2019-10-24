node {
  stage('checkout') {
        checkout scm
  }

  /* To create AWS Instances */
  stage('Automating') {
       def instances=params.No_of_Instances_required
       def image_type=params.EC2_Image_ID
       def image= sh ("echo "Ubuntu:ami-04b9e92b5572fa0d1" | awk -F":" '{ print $2}'")
       if (params.Automation_Type == 'Full_Automation')
       {
         sh ("cd /opt/automation/terraform/dev && terraform plan -out=tfplan \
             -input=false -var='insta_count='${instances}'' -var='ami_type='${image}'' -lock=false") 
         sh ("cd /opt/automation/terraform/dev && terraform apply tfplan")
       /*  sh ("cd /opt/terransijenk/terraform/dev && terraform apply -var='insta_count='${instances}'' -var='ami_type='${image}'' -auto-approve -lock=false -no-color -out=create.tfplan") 
        */ 
             
         def docker_image=params.Docker_Image
         sh ("cd /opt/automation/ansible && sudo sleep 30; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook \
             -u ubuntu -e image_id='${docker_image}' --private-key Jenkins.pem -i invent installdocker.yml")     
       
       }      
       
      
   }
}
