import Header from "@/components/Common/Header";
import SideBar from "@/components/Common/SideBar";
import { User } from "@prisma/client";
import { getCurrentUser } from "@/lib/session";

export default async function DashLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const user = await getCurrentUser();
  return (
    <section className="">
    <div className=" min-h-screen bg-slate-100 dark:bg-black">
      <SideBar user = { user as User}  />
      <div className="sm:ml-[6rem] " >  
        <Header user = { user as User} />
        {children}
      </div>
    </div>
  </section>
  );
}