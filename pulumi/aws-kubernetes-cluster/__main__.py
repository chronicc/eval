"""A full example of an AWS Kubernetes Cluster Deployment"""

import pulumi
import pulumi_aws as aws
import pulumi_awsx as awsx


config = pulumi.Config()
eks_default_instance = config.get("eks-default-instance") or "t3.medium"
eks_desired_size = config.get("eks-desired-size") or 3
eks_max_size = config.get("eks-max-size") or 6
eks_min_size = config.get("eks-min-size") or 3
owner = config.get("owner") or "kts"
project = pulumi.get_project()
stack = pulumi.get_stack()
vpc_az_count = config.get("vpc-az-count") or 2
vpc_cidr = config.get("vpc-cidr") or "10.0.0.0/16"


# Configure the AWS provider
aws_provider = aws.Provider(
    "default",
    default_tags={
        "Owner": owner,
        "Project": project,
        "Pulumi": "true",
        "Stack": stack,
    },
    profile=config.get("aws:profile"),
    region=config.get("aws:region"),
)

# Create a VPC
vpc = awsx.ec2.Vpc(
    f"{owner}-{project}-{stack}-vpc",
    cidr_block=vpc_cidr,
    enable_dns_hostnames=True,
    nat_gateways=awsx.ec2.vpc.NatGatewayConfigurationArgs(
        strategy=awsx.ec2.vpc.NatGatewayStrategy.NONE,
    ),
    number_of_availability_zones=vpc_az_count,
    subnet_specs=[
        awsx.ec2.vpc.SubnetSpecArgs(
            cidr_mask=18,
            tags={"kubernetes.io/role/elb": "1"},
            type=awsx.ec2.vpc.SubnetType.PUBLIC,
        )
    ],
    subnet_strategy=awsx.ec2.vpc.SubnetAllocationStrategy.AUTO,
)

pulumi.export("eksDefaultInstance", eks_default_instance)
pulumi.export("eksMaxSize", eks_max_size)
pulumi.export("eksMinSize", eks_min_size)
pulumi.export("owner", owner)
pulumi.export("project", project)
pulumi.export("stack", stack)
pulumi.export("vpcCidr", vpc_cidr)
pulumi.export("vpcId", vpc.vpc_id)
pulumi.export("vpcPrivateSubnetIds", vpc.private_subnet_ids)
pulumi.export("vpcPublicSubnetIds", vpc.public_subnet_ids)
