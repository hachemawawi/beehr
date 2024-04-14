import Container from "@/components/Common/Container";
import { User } from "@prisma/client";
import DialogWrapper from "@/components/Common/DialogWrapper";

type Props = {
  user: User;
};

const WelcomeBanner = ({ user }: Props) => {
  return (
    <Container>
      <div className="flex flex-wrap justify-between items-center my-6 ">
        {/* LEFT SIDE */}
        <div className="flex justify-start items-center">
          <h2 className="text-xl font-extrabold leading-tight  lg:text-2xl">
            Welcome {""}!
          </h2>
        </div>

        {/* RIGHT SIDE  */}

        <div className="flex items-center space-x-3 md:space-x-6">
            <DialogWrapper
            btnTitle="Apply for Leave"
            title="Submit your Leave Application"
            descr="Make sure you select the right dates for leave. "
            isBtn={true}
            >
                <p>Hi</p>

            </DialogWrapper>
            
        </div>
      </div>
    </Container>
  );
};

export default WelcomeBanner;