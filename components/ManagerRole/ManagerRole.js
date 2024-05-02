import { Box, Heading, Text } from "@chakra-ui/react";
import React from "react";

const ManagerRole = () => {
  return (
    <Box p={4} borderWidth="1px" borderRadius="md" shadow="md">
      <Heading as="h2" size="lg" mb={4}>
        Manager Role in Absence Management
      </Heading>
      <Text fontSize="lg" mb={4}>
        As a manager, your role in the absence management system is crucial for
        maintaining productivity and ensuring the well-being of your team. Your
        responsibilities include:
      </Text>
      <ul>
        <li>
          <Text fontSize="md">
            Reviewing and approving employee leave requests in a timely manner.
          </Text>
        </li>
        <li>
          <Text fontSize="md">
            Communicating leave policies and procedures to your team members.
          </Text>
        </li>
        <li>
          <Text fontSize="md">
            Monitoring the overall leave balance of your team to prevent
            scheduling conflicts and ensure adequate staffing.
          </Text>
        </li>
        <li>
          <Text fontSize="md">
            Addressing any concerns or issues related to employee absences,
            including unexpected leaves or prolonged absences.
          </Text>
        </li>
        <li>
          <Text fontSize="md">
            Collaborating with HR and other managers to develop and implement
            strategies for effective absence management.
          </Text>
        </li>
      </ul>
      <Text fontSize="lg" mt={4}>
        By fulfilling these responsibilities, you contribute to maintaining a
        positive work environment and supporting the success of your team and
        the organization as a whole.
      </Text>
    </Box>
  );
};

export default ManagerRole;
